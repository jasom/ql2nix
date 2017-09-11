
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-scripting, 
   lisp_fare-utils, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-utils lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "cl-scripting/test";
      
      sourceProject = "${lisp-project_cl-scripting}";
      patches = [];
      lisp_dependencies = "${lisp_fare-utils} ${lisp_hu-dwim-stefil}";
      name = "lisp_cl-scripting-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
