
{ buildLispPackage, stdenv, fetchurl, lisp-project_harmony, 
   lisp_bordeaux-threads, lisp_cl-mixed, lisp_flow,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cl-mixed lisp_flow  ];
      inherit stdenv;
      systemName = "harmony";
      
      sourceProject = "${lisp-project_harmony}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cl-mixed} ${lisp_flow}";
      name = "lisp_harmony-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
