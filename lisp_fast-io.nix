
{ buildLispPackage, stdenv, fetchurl, lisp-project_fast-io, 
   lisp_alexandria, lisp_trivial-gray-streams, lisp_static-vectors,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_trivial-gray-streams lisp_static-vectors  ];
      inherit stdenv;
      systemName = "fast-io";
      
      sourceProject = "${lisp-project_fast-io}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_trivial-gray-streams} ${lisp_static-vectors}";
      name = "lisp_fast-io-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }