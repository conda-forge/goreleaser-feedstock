go build -buildmode=pie -trimpath -o="%LIBRARY_BIN%\goreleaser.exe" -ldflags="-s -w -X main.Version=%PKG_VERSION%" || goto :error
go-licenses save . --save_path=license-files --ignore github.com/mattn/go-localereader --ignore golang.org/x/sys/unix --ignore golang.org/x/crypto/blake2b --ignore golang.org/x/sys/cpu --ignore golang.org/x/crypto/blake2s --ignore golang.org/x/crypto/sha3 --ignore github.com/cloudflare/circl/dh/x25519 --ignore github.com/ipfs/bbloom --ignore golang.org/x/crypto/salsa20/salsa --ignore github.com/multiformats/go-base36 --ignore debug/macho --ignore encoding/csv --ignore expvar --ignore go/build --ignore go/constant --ignore go/format --ignore go/scanner --ignore go/types --ignore hash/maphash --ignore mime/quotedprintable --ignore net --ignore runtime/debug --ignore strings --ignore testing --ignore text --ignore time --ignore crypto --ignore regex --ignore encoding --ignore compress --ignore hash --ignore go --ignore internal --ignore unicode || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
