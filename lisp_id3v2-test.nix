
{ buildLispPackage, stdenv, fetchurl, lisp-project_id3v2, 
   lisp_flexi-streams, lisp_id3v2, lisp_prove, lisp_prove-asdf,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_id3v2 lisp_prove lisp_prove-asdf  ];
      inherit stdenv;
      systemName = "id3v2-test";
      
      sourceProject = "${lisp-project_id3v2}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_id3v2} ${lisp_prove} ${lisp_prove-asdf}";
      name = "lisp_id3v2-test-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
