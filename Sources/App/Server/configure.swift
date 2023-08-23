import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // Config server
    server(app)
    // Config global
    configGlobal(app)
    // Databases
    try databases(app)
    // Middlewares
    try middlewares(app)

    // register migrations
    try await migrations(app)

    // register routes
    try routes(app)
}

func configGlobal(_ app: Application) {
    // Set up JSON decoding for ISO 8601 dates
    let jsonDecoder = JSONDecoder()
    jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601withMilliseconds)
    ContentConfiguration.global.use(decoder: jsonDecoder, for: .json)

    let jsonEncoder = JSONEncoder()
    jsonEncoder.dateEncodingStrategy = .formatted(DateFormatter.iso8601withMilliseconds)
    ContentConfiguration.global.use(encoder: jsonEncoder, for: .json)

    if let isDebug = Bool(Environment.get("IS_DEBUG") ?? "false"), isDebug {
        app.logger.logLevel = .debug
    }
}
