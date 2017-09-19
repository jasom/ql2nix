
{ buildLispPackage, stdenv, fetchurl, lisp-project_clip, 
   lisp_lquery, lisp_array-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lquery lisp_array-utils  ];
      inherit stdenv;
      systemName = "clip";
      
      sourceProject = "${lisp-project_clip}";
      patches = [];
      lisp_dependencies = "${lisp_lquery} ${lisp_array-utils}";
      name = "lisp_clip-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
