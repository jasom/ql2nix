
{ buildLispPackage, stdenv, fetchurl, lisp-project_defpackage-plus, 
   lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "defpackage-plus";
      
      sourceProject = "${lisp-project_defpackage-plus}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_defpackage-plus-20160628-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
