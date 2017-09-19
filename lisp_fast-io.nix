
{ buildLispPackage, stdenv, fetchurl, lisp-project_fast-io, 
   lisp_static-vectors, lisp_trivial-gray-streams, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_static-vectors lisp_trivial-gray-streams lisp_alexandria  ];
      inherit stdenv;
      systemName = "fast-io";
      
      sourceProject = "${lisp-project_fast-io}";
      patches = [];
      lisp_dependencies = "${lisp_static-vectors} ${lisp_trivial-gray-streams} ${lisp_alexandria}";
      name = "lisp_fast-io-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
