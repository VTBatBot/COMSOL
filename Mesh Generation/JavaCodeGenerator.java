import java.io.*;


public class JavaCodeGenerator {
	
	public static void main(String[] args) throws FileNotFoundException {
		int l = 5;
		int maxC = 8;
		int maxD = 6;
		int maxL = 23;
		
		while(l <= maxL) { 
			int c = 1;
			while(c <= maxC) {
				int d = 1;
				while(d<=maxD) {
		
					String strC = Integer.toString(c);
					String strD = Integer.toString(d);
					String strL = Integer.toString(l);
					String planeDataFileName = "planeData"+strL+"l"+strC+"c"+strD+"d.txt"; 
					String pointDataFileName = "pointData"+strL+"l"+strC+"c"+strD+"d.txt"; 
					Double cutPlaneDeltaZ = 1 + 0.26*(d-1);
					Double cutPointXposition = l + 0.25;
					String strCutPlane = Double.toString(cutPlaneDeltaZ);
					String strCutPoint = Double.toString(cutPointXposition);
					
					String className = "Length" +strL + "params" + strC + "c" + strD + "d";
					String importFileName = "waveguide"+strL+"cm"+strC+"c"+strD+"d.stl";
					String maxTime = "0.012";
					String timeStep = "1e-6";
					
					String code = "import com.comsol.model.*;\r\n" + 
							"import com.comsol.model.util.*;\r\n" + 
							"\r\n" + 
							"/** Model exported on May 25 2018, 13:20 by COMSOL 5.3.0.260. */\r\n" + 
							"public class "+ className + " {\r\n" + 
							"\r\n" + 
							"  public static Model run() {\r\n" + 
							"    Model model = ModelUtil.create(\"Model\");\r\n" + 
							"\r\n" + 
							"    model.modelPath(\"/work/newriver/nathc17\");\r\n" + 
							"\r\n" + 
							"    model.comments(\"Untitled\\n\\n\");\r\n" + 
							"\r\n" + 
							"    model.component().create(\"comp1\", true);\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").geom().create(\"geom1\", 3);\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").mesh().create(\"mesh1\");\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").physics().create(\"actd\", \"TransientPressureAcoustics\", \"geom1\");\r\n" + 
							"\r\n" + 
							"    model.study().create(\"std1\");\r\n" + 
							"    model.study(\"std1\").create(\"time\", \"Transient\");\r\n" + 
							"    model.study(\"std1\").feature(\"time\").activate(\"actd\", true);\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").lengthUnit(\"cm\");\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").create(\"imp1\", \"Import\");\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").feature(\"imp1\").set(\"type\", \"mesh\");\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").feature(\"imp1\")\r\n" + 
							"         .set(\"meshfilename\", \"/work/newriver/nathc17/MeshesForComsol/partsstl2/"+ importFileName +"\");\r\n" + 
							"\r\n" + 
							"    model.component().create(\"mcomp1\", \"MeshComponent\");\r\n" + 
							"\r\n" + 
							"    model.geom().create(\"mgeom1\", 3);\r\n" + 
							"    model.geom(\"mgeom1\").lengthUnit(\"cm\");\r\n" + 
							"\r\n" + 
							"    model.mesh().create(\"mpart1\", \"mgeom1\");\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").feature(\"imp1\").set(\"mesh\", \"mpart1\");\r\n" + 
							"\r\n" + 
							"    model.mesh(\"mpart1\").create(\"imp1\", \"Import\");\r\n" + 
							"    model.mesh(\"mpart1\").feature(\"imp1\")\r\n" + 
							"         .set(\"filename\", \"/work/newriver/nathc17/MeshesForComsol/partsstl2/"+ importFileName +"\");\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").feature(\"imp1\").set(\"meshfilename\", \"\");\r\n" + 
							"\r\n" + 
							"    model.mesh(\"mpart1\").run();\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").feature(\"imp1\").importData();\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").run(\"imp1\");\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").create(\"uni1\", \"Union\");\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").feature(\"uni1\").selection(\"input\").set(new String[]{\"imp1\"});\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").run();\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").feature(\"uni1\").set(\"intbnd\", false);\r\n" + 
							"    model.component(\"comp1\").geom(\"geom1\").run();\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").material().create(\"mat1\", \"Common\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").label(\"Air\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").set(\"family\", \"air\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"relpermeability\", \"1\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"relpermittivity\", \"1\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"dynamicviscosity\", \"eta(T[1/K])[Pa*s]\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"ratioofspecificheat\", \"1.4\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"electricconductivity\", \"0[S/m]\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"heatcapacity\", \"Cp(T[1/K])[J/(kg*K)]\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"density\", \"rho(pA[1/Pa],T[1/K])[kg/m^3]\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"thermalconductivity\", \"k(T[1/K])[W/(m*K)]\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").set(\"soundspeed\", \"cs(T[1/K])[m/s]\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func().create(\"eta\", \"Piecewise\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"eta\").set(\"funcname\", \"eta\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"eta\").set(\"arg\", \"T\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"eta\").set(\"extrap\", \"constant\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"eta\")\r\n" + 
							"         .set(\"pieces\", new String[][]{{\"200.0\", \"1600.0\", \"-8.38278E-7+8.35717342E-8*T^1-7.69429583E-11*T^2+4.6437266E-14*T^3-1.06585607E-17*T^4\"}});\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func().create(\"Cp\", \"Piecewise\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"Cp\").set(\"funcname\", \"Cp\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"Cp\").set(\"arg\", \"T\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"Cp\").set(\"extrap\", \"constant\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"Cp\")\r\n" + 
							"         .set(\"pieces\", new String[][]{{\"200.0\", \"1600.0\", \"1047.63657-0.372589265*T^1+9.45304214E-4*T^2-6.02409443E-7*T^3+1.2858961E-10*T^4\"}});\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func().create(\"rho\", \"Analytic\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"rho\").set(\"funcname\", \"rho\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"rho\").set(\"args\", new String[]{\"pA\", \"T\"});\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"rho\").set(\"expr\", \"pA*0.02897/8.314/T\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"rho\").set(\"dermethod\", \"manual\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"rho\")\r\n" + 
							"         .set(\"argders\", new String[][]{{\"pA\", \"d(pA*0.02897/8.314/T,pA)\"}, {\"T\", \"d(pA*0.02897/8.314/T,T)\"}});\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func().create(\"k\", \"Piecewise\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"k\").set(\"funcname\", \"k\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"k\").set(\"arg\", \"T\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"k\").set(\"extrap\", \"constant\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"k\")\r\n" + 
							"         .set(\"pieces\", new String[][]{{\"200.0\", \"1600.0\", \"-0.00227583562+1.15480022E-4*T^1-7.90252856E-8*T^2+4.11702505E-11*T^3-7.43864331E-15*T^4\"}});\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func().create(\"cs\", \"Analytic\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"cs\").set(\"funcname\", \"cs\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"cs\").set(\"args\", new String[]{\"T\"});\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"cs\").set(\"expr\", \"sqrt(1.4*287*T)\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"cs\").set(\"dermethod\", \"manual\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").func(\"cs\")\r\n" + 
							"         .set(\"argders\", new String[][]{{\"T\", \"d(sqrt(1.4*287*T),T)\"}});\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").addInput(\"temperature\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"def\").addInput(\"pressure\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup().create(\"RefractiveIndex\", \"Refractive index\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").propertyGroup(\"RefractiveIndex\").set(\"n\", \"1\");\r\n" + 
							"    model.component(\"comp1\").material(\"mat1\").set(\"family\", \"air\");"  ;
					
					String code2 = "\r\n	model.func().create(\"step1\", \"Step\");\r\n" + 
							"    model.func(\"step1\").set(\"to\", \"0.002\");\r\n" + 
							"    model.func(\"step1\").set(\"location\", \"0.002\");\r\n" + 
							"    model.func(\"step1\").set(\"from\", \"1\");\r\n" + 
							"    model.func(\"step1\").set(\"to\", \"0\");\r\n" + 
							"    model.func(\"step1\").set(\"smoothactive\", true);\r\n" + 
							"    model.func(\"step1\").set(\"smooth\", \"0\");\r\n" +
							"    model.func().create(\"an1\", \"Analytic\");\r\n" + 
							"    model.func(\"an1\").label(\"chirp\");\r\n" + 
							"    model.func(\"an1\").set(\"funcname\", \"chirp\");\r\n" + 
							"    model.func(\"an1\").set(\"expr\", \"step1(t)*2*sin(2*pi*(20000*(0.002-t)+((120000-20000)/0.002)*(0.002-t)^2))\");\r\n" + 
							"    model.func(\"an1\").set(\"args\", \"t\");\r\n" + 
							"    model.func().create(\"an2\", \"Analytic\");\r\n" + 
							"    model.func(\"an2\").label(\"hann\");\r\n" + 
							"    model.func(\"an2\").set(\"funcname\", \"hann\");\r\n" + 
							"    model.func(\"an2\").set(\"expr\", \"step1(t)*0.5*(1-cos(2*pi*t/0.002))\");\r\n" + 
							"    model.func(\"an2\").set(\"args\", \"t\");\r\n" + 
							"\r\n" + 
							"    model.component(\"comp1\").physics(\"actd\").create(\"imp1\", \"Impedance\", 2);\r\n" + 
							"    model.component(\"comp1\").physics(\"actd\").feature(\"imp1\").selection().set(new int[]{3, 4});\r\n" + 
							"    model.component(\"comp1\").physics(\"actd\").create(\"pr1\", \"Pressure\", 2);\r\n" + 
							"    model.component(\"comp1\").physics(\"actd\").feature(\"pr1\").selection().set(new int[]{1});\r\n" + 
							"    model.component(\"comp1\").physics(\"actd\").feature(\"pr1\").set(\"p0\", \"hann(t)*chirp(t)\");\r\n" + 
							"    model.component(\"comp1\").physics(\"actd\").prop(\"TransientSettings\").set(\"fmax\", \"120000[Hz]\");\r\n" + 
							"\r\n" + 
							"    model.study(\"std1\").feature(\"time\").set(\"tlist\", \"range(0,"+ timeStep +","+ maxTime +")\");\r\n" + 
							"\r\n" + 
							"    model.label(\"updatedSimulation.mph\");\r\n" + 
							"\r\n" + 
							"    model.study(\"std1\").run();\r\n" + 
							"\r\n" + 
							"    model.label(\"updatedResults.mph\");\r\n" + 
							"\r\n" + 
							"    model.result().dataset().create(\"cpl1\", \"CutPlane\");\r\n" + 
							"    model.result().dataset(\"cpl1\").set(\"quickplane\", \"xy\");\r\n" + 
							"    model.result().dataset(\"cpl1\").set(\"quickz\", "+ strCutPlane +");\r\n" + 
							"\r\n" + 
							"    model.sol(\"sol1\").updateSolution();\r\n" + 
							"\r\n" + 
							"    model.result().dataset().create(\"cpt1\", \"CutPoint2D\");\r\n" + 
							"    model.result().dataset(\"cpt1\").set(\"pointx\", " + strCutPoint + ");\r\n" + 
							"    model.result().dataset(\"cpt1\").set(\"pointy\", 0);\r\n" + 
							"\r\n" + 
							"    model.sol(\"sol1\").updateSolution();\r\n" + 
							"\r\n" + 
							"    model.result().export().create(\"data1\", \"Data\");\r\n" + 
							"    model.result().export(\"data1\").set(\"data\", \"cpl1\");\r\n" + 
							"    model.result().export(\"data1\").setIndex(\"expr\", \"t\", 0);\r\n" + 
							"    model.result().export(\"data1\").setIndex(\"expr\", \"p\", 1);\r\n" + 
							"    model.result().export(\"data1\").set(\"filename\", \"/work/newriver/nathc17/COMSOL simulations/Data Files/"+ planeDataFileName +"\");\r\n" + 
							"    model.result().export(\"data1\").run();\r\n" + 
							"    model.result().export().create(\"data2\", \"Data\");\r\n" + 
							"    model.result().export(\"data2\").set(\"data\", \"cpt1\");\r\n" + 
							"    model.result().export(\"data2\").setIndex(\"expr\", \"t\", 0);\r\n" + 
							"    model.result().export(\"data2\").setIndex(\"expr\", \"p\", 1);\r\n" + 
							"    model.result().export(\"data2\").set(\"filename\", \"/work/newriver/nathc17/COMSOL simulations/Data Files/"+ pointDataFileName +"\");\r\n" + 
							"    model.result().export(\"data2\").run();\r\n" + 
							"\r\n" + 
							"    return model;\r\n" + 
							"  }\r\n" + 
							"\r\n" + 
							"  public static void main(String[] args) {\r\n" + 
							"    run();\r\n" + 
							"  }\r\n" + 
							"\r\n" + 
							"}"  ;
					
					
					String fileName = "Length" + strL + "params" + strC + "c" + strD + "d.Java";
					String pathName = "C:\\Users\\wnath\\Documents\\COMSOL\\JAVACODES\\" + fileName;
					@SuppressWarnings("resource")
					PrintWriter writer = new PrintWriter(pathName);
					writer.println(code);
					writer.flush();
					writer.println(code2);
					writer.flush();
					d = d+1;
				}
			c = c+1;	
			}
		
		l = l + 2;	
		}
		
	}
}