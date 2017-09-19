
{ buildLispPackage, stdenv, fetchurl, lisp-project_3bmd, 
   lisp_split-sequence, lisp_esrap,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_split-sequence lisp_esrap  ];
      inherit stdenv;
      systemName = "3bmd";
      
      sourceProject = "${lisp-project_3bmd}";
      patches = [];
      lisp_dependencies = "${lisp_split-sequence} ${lisp_esrap}";
      name = "lisp_3bmd-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
