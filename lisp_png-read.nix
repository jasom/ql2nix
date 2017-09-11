
{ buildLispPackage, stdenv, fetchurl, lisp-project_png-read, 
   lisp_iterate, lisp_chipz, lisp_babel,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate lisp_chipz lisp_babel  ];
      inherit stdenv;
      systemName = "png-read";
      
      sourceProject = "${lisp-project_png-read}";
      patches = [];
      lisp_dependencies = "${lisp_iterate} ${lisp_chipz} ${lisp_babel}";
      name = "lisp_png-read-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
