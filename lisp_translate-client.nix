
{ buildLispPackage, stdenv, fetchurl, lisp-project_translate-client, 
   lisp_alexandria, lisp_quri, lisp_dexador, lisp_assoc-utils, lisp_yason,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_quri lisp_dexador lisp_assoc-utils lisp_yason  ];
      inherit stdenv;
      systemName = "translate-client";
      
      sourceProject = "${lisp-project_translate-client}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_quri} ${lisp_dexador} ${lisp_assoc-utils} ${lisp_yason}";
      name = "lisp_translate-client-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
