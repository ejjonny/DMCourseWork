import Cocoa

var volunteerCounts = [1,3,40,32,2,53,77,13]

volunteerCounts = volunteerCounts.sorted()
volunteerCounts

func makeTownGrand(withBudget budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(byAddingLights lights: Int, toExistingLights existingLights: Int) -> Int {
            return lights + existingLights
        }
        return buildRoads
    } else {
        return nil
    }
}

func evaluate(budget: Int) -> Bool {
    return budget > 10_000
}

var stoplights = 4

if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10_000, condition: evaluate) {
    stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
}

if let newTownPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10_500, condition: evaluate) {
    stoplights = newTownPlanByAddingLightsToExistingLights(4, stoplights)
}

print("Knowhere has \(stoplights) stoplights.")

func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker
}

var currentPopulation = 5_422
let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)
growBy(500)
growBy(500)
growBy(500)
currentPopulation = growBy(500) // currentPopulation is now 7422

let anotherGrowBy = growBy
anotherGrowBy(500)

var bigCityPopulation = 4_061_981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10_000)
currentPopulation

let precinctPopulations = [1244, 2021, 2157]
let projectedPopulations = precinctPopulations.map {$0 * 2}
projectedPopulations

let bigProjections = projectedPopulations.filter {$0 > 4000}
bigProjections

let totalProjection = projectedPopulations.reduce(0) {$0 + $1}

totalProjection
