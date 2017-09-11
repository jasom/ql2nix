
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-webkit, 
   lisp_cl-webkit2, lisp_lisp-unit,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-webkit2 lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "cl-webkit2-tests";
      
      sourceProject = "${lisp-project_cl-webkit}";
      patches = [];
      lisp_dependencies = "${lisp_cl-webkit2} ${lisp_lisp-unit}";
      name = "lisp_cl-webkit2-tests-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
