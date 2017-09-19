
{ buildLispPackage, stdenv, fetchurl, lisp-project_open-vrp, 
   lisp_cl-fad, lisp_fiveam, lisp_alexandria, lisp_vecto,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_fiveam lisp_alexandria lisp_vecto  ];
      inherit stdenv;
      systemName = "open-vrp";
      
      sourceProject = "${lisp-project_open-vrp}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_fiveam} ${lisp_alexandria} ${lisp_vecto}";
      name = "lisp_open-vrp-20140914-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
