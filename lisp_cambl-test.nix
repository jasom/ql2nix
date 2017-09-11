
{ buildLispPackage, stdenv, fetchurl, lisp-project_cambl, 
   lisp_cambl, lisp_xlunit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cambl lisp_xlunit  ];
      inherit stdenv;
      systemName = "cambl-test";
      
      sourceProject = "${lisp-project_cambl}";
      patches = [];
      lisp_dependencies = "${lisp_cambl} ${lisp_xlunit}";
      name = "lisp_cambl-test-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
