
{ buildLispPackage, stdenv, fetchurl, lisp-project_injection, 
   lisp_fiveam, lisp_injection,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_injection  ];
      inherit stdenv;
      systemName = "injection-test";
      
      sourceProject = "${lisp-project_injection}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_injection}";
      name = "lisp_injection-test-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
