# itamae-recipe-drone


## first, you run itamae recipe

```bash
itamae ssh -h your.host -u root cookbooks/drone/default.rb
```

## then, you copy drone.toml from 

```bash
cd $GOPATH/src/github.com/drone/drone
cp dist/drone/etc/drone/drone.toml ./
```

## finally, start drone

```bash
bin/drone --debug --config=drone.toml
```

