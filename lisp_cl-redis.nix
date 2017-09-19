
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-redis, 
   lisp_babel, lisp_flexi-streams, lisp_usocket, lisp_cl-ppcre, lisp_rutils,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_flexi-streams lisp_usocket lisp_cl-ppcre lisp_rutils  ];
      inherit stdenv;
      systemName = "cl-redis";
      
      sourceProject = "${lisp-project_cl-redis}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_flexi-streams} ${lisp_usocket} ${lisp_cl-ppcre} ${lisp_rutils}";
      name = "lisp_cl-redis-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
