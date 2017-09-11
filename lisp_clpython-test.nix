
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-python, 
   lisp_clpython-basic, lisp_clpython-parser, lisp_clpython-runtime, lisp_ptester,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clpython-basic lisp_clpython-parser lisp_clpython-runtime lisp_ptester  ];
      inherit stdenv;
      systemName = "clpython/test";
      
      sourceProject = "${lisp-project_cl-python}";
      patches = [];
      lisp_dependencies = "${lisp_clpython-basic} ${lisp_clpython-parser} ${lisp_clpython-runtime} ${lisp_ptester}";
      name = "lisp_clpython-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
