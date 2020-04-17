# Get Data from :
# sudo /opt/ripple/bin/rippled feature 
# running in container? : sudo docker exec rippledvalidator /opt/ripple/bin/rippled feature
# and put json output in $features variable

$features = @"
{
   "result" : {
      "features" : {
         "00C1FC4A53E60AB02C864641002B3172F38677E29C26C5406685179B37E1EDAC" : {
            "count" : 27,
            "enabled" : false,
            "name" : "RequireFullyCanonicalSig",
            "supported" : true,
            "threshold" : 29,
            "validations" : 37,
            "vetoed" : false,
            "vote" : 238
         },
         "07D43DCE529B15A10827E5E04943B496762F9A88E3268269D69C44BE49E21104" : {
            "enabled" : true,
            "name" : "Escrow",
            "supported" : true,
            "vetoed" : false
         },
      "status" : "success"
   }
}
"@

function Get-Ammendments{
param(
 $features
)
$json = $features | ConvertFrom-Json
$amdsHashes = ($json.result.features | Get-Member -MemberType NoteProperty | select name).Name

$amdsHashes |%{
 $ammend = $json.result.features.$_
 [pscustomobject]@{
  Hash = $_
  Name = $ammend.name
  Enabled = $ammend.enabled
  Supported = $ammend.supported
  Vetoed = $ammend.vetoed 
  Count = $ammend.count
  Threshold = $ammend.threshold
  Validations = $ammend.validations
  Vote = $ammend.vote
 }
} | sort Enabled, count 
}

Get-Ammendments $features | ft
 
