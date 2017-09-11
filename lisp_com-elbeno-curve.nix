
{ buildLispPackage, stdenv, fetchurl, lisp-project_curve, 
   lisp_com-elbeno-vector, lisp_vecto,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-elbeno-vector lisp_vecto  ];
      inherit stdenv;
      systemName = "com.elbeno.curve";
      
      sourceProject = "${lisp-project_curve}";
      patches = [];
      lisp_dependencies = "${lisp_com-elbeno-vector} ${lisp_vecto}";
      name = "lisp_com-elbeno-curve-20130128-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
