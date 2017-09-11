
{ buildLispPackage, stdenv, fetchurl, lisp-project_rate-monotonic, 
   lisp_bordeaux-threads, lisp_rate-monotonic,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_rate-monotonic  ];
      inherit stdenv;
      systemName = "rate-monotonic.examples";
      
      sourceProject = "${lisp-project_rate-monotonic}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_rate-monotonic}";
      name = "lisp_rate-monotonic-examples-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
