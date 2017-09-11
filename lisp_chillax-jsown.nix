
{ buildLispPackage, stdenv, fetchurl, lisp-project_chillax, 
   lisp_chillax-core, lisp_jsown,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_chillax-core lisp_jsown  ];
      inherit stdenv;
      systemName = "chillax.jsown";
      
      sourceProject = "${lisp-project_chillax}";
      patches = [];
      lisp_dependencies = "${lisp_chillax-core} ${lisp_jsown}";
      name = "lisp_chillax-jsown-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
