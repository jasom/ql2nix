
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-python, 
   lisp_clpython-basic, lisp_clpython-parser, lisp_clpython-runtime,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clpython-basic lisp_clpython-parser lisp_clpython-runtime  ];
      inherit stdenv;
      systemName = "clpython";
      
      sourceProject = "${lisp-project_cl-python}";
      patches = [];
      lisp_dependencies = "${lisp_clpython-basic} ${lisp_clpython-parser} ${lisp_clpython-runtime}";
      name = "lisp_clpython-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
