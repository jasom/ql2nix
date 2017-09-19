
{ buildLispPackage, stdenv, fetchurl, lisp-project_birch, 
   lisp_alexandria, lisp_flexi-streams, lisp_usocket, lisp_split-sequence,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_flexi-streams lisp_usocket lisp_split-sequence  ];
      inherit stdenv;
      systemName = "birch";
      
      sourceProject = "${lisp-project_birch}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_flexi-streams} ${lisp_usocket} ${lisp_split-sequence}";
      name = "lisp_birch-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
