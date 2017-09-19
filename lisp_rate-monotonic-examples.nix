
{ buildLispPackage, stdenv, fetchurl, lisp-project_rate-monotonic, 
   lisp_timer-wheel, lisp_bordeaux-threads,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_timer-wheel lisp_bordeaux-threads  ];
      inherit stdenv;
      systemName = "rate-monotonic.examples";
      
      sourceProject = "${lisp-project_rate-monotonic}";
      patches = [];
      lisp_dependencies = "${lisp_timer-wheel} ${lisp_bordeaux-threads}";
      name = "lisp_rate-monotonic-examples-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
