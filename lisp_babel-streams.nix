
{ buildLispPackage, stdenv, fetchurl, lisp-project_babel, 
   lisp_trivial-gray-streams, lisp_alexandria, lisp_trivial-features,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams lisp_alexandria lisp_trivial-features  ];
      inherit stdenv;
      systemName = "babel-streams";
      
      sourceProject = "${lisp-project_babel}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams} ${lisp_alexandria} ${lisp_trivial-features}";
      name = "lisp_babel-streams-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
