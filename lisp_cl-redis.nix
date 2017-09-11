
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-redis, 
   lisp_babel, lisp_cl-ppcre, lisp_flexi-streams, lisp_rutils, lisp_usocket,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-ppcre lisp_flexi-streams lisp_rutils lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-redis";
      
      sourceProject = "${lisp-project_cl-redis}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-ppcre} ${lisp_flexi-streams} ${lisp_rutils} ${lisp_usocket}";
      name = "lisp_cl-redis-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
