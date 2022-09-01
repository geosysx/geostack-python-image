try:
    import geostack
    from geostack.raster import Raster
    from geostack.runner import runScript

    testA = Raster(name='testA')
    testA.init(nx=256, hx=1.0, ny=256.0, hy=1.0)
    runScript("testA = randomNormal(0, 1);", [testA])

    print("Geostack is loaded!")
except Exception as _:
    print("Geostack installation doesn't work")
    raise RuntimeError("failed")