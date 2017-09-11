
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-python, 
   lisp_clpython-basic, lisp_clpython-runtime, lisp_clpython-parser,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_clpython-basic lisp_clpython-runtime lisp_clpython-parser  ];
      inherit stdenv;
      systemName = "clpython/contrib";
      
      sourceProject = "${lisp-project_cl-python}";
      patches = [];
      lisp_dependencies = "${lisp_clpython-basic} ${lisp_clpython-runtime} ${lisp_clpython-parser}";
      name = "lisp_clpython-contrib-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
