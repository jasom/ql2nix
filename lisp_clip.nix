
{ buildLispPackage, stdenv, fetchurl, lisp-project_clip, 
   lisp_array-utils, lisp_lquery,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_array-utils lisp_lquery  ];
      inherit stdenv;
      systemName = "clip";
      
      sourceProject = "${lisp-project_clip}";
      patches = [];
      lisp_dependencies = "${lisp_array-utils} ${lisp_lquery}";
      name = "lisp_clip-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
