
{ buildLispPackage, stdenv, fetchurl, lisp-project_id3v2, 
   lisp_babel, lisp_trivial-gray-streams,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_trivial-gray-streams  ];
      inherit stdenv;
      systemName = "id3v2";
      
      sourceProject = "${lisp-project_id3v2}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_trivial-gray-streams}";
      name = "lisp_id3v2-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
