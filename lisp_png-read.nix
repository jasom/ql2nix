
{ buildLispPackage, stdenv, fetchurl, lisp-project_png-read, 
   lisp_babel, lisp_chipz, lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_chipz lisp_iterate  ];
      inherit stdenv;
      systemName = "png-read";
      
      sourceProject = "${lisp-project_png-read}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_chipz} ${lisp_iterate}";
      name = "lisp_png-read-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
