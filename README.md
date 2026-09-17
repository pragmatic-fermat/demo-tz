# demo-tz

Petite application PHP 8.3 (page affichant l'heure courante et le fuseau horaire) servie par nginx et php-fpm dans un même conteneur.

## Récupérer l'image

L'image est publiée dans GHCR (GitHub Container Registry) :

```bash
docker pull ghcr.io/pragmatic-fermat/demo-tz:main
```

Le dépôt et l'image étant privés, il faut s'authentifier au préalable avec un PAT disposant du scope `read:packages` :

```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u pragmatic-fermat --password-stdin
```

## Construire et publier

Le workflow `.github/workflows/docker-publish.yml` construit l'image et la publie dans GHCR :

- sur tout push, quelle que soit la branche (donc sur n'importe quel commit) ;
- sur les tags `v*`, qui produisent en plus des tags de version semver ;
- manuellement, via `workflow_dispatch` (onglet Actions, Run workflow), sur n'importe quelle branche ou commit.

Tags publiés :

| Tag | Signification |
| --- | --- |
| `main` | dernière image de la branche main |
| `<branche>` | image d'une branche quelconque |
| `X.Y.Z` et `X.Y` | version issue d'un tag `vX.Y.Z` |
| `sha-<abbr>` | commit précis |

## Utiliser l'image

```bash
docker run --rm -p 8080:80 ghcr.io/pragmatic-fermat/demo-tz:main
```

L'application est ensuite accessible sur http://localhost:8080.

## Construire localement

```bash
docker build -t demo-tz .
docker run --rm -p 8080:80 demo-tz
```
