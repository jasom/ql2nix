
{ buildLispPackage, stdenv, fetchurl, lisp-project_pngload, 
   lisp_chipz, lisp_fast-io, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_chipz lisp_fast-io lisp_alexandria  ];
      inherit stdenv;
      systemName = "pngload";
      
      sourceProject = "${lisp-project_pngload}";
      patches = [];
      lisp_dependencies = "${lisp_chipz} ${lisp_fast-io} ${lisp_alexandria}";
      name = "lisp_pngload-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
