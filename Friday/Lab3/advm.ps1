Configuration advm {
    node('advm') {
        File TestFile {
            Ensure = 'present'
            DestinationPath = 'c:\test.txt'
            Contents = 'hello world'
        }
    }
}