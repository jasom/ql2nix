
{ buildLispPackage, stdenv, fetchurl, lisp-project_yason, 
   lisp_trivial-gray-streams, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-gray-streams lisp_alexandria  ];
      inherit stdenv;
      systemName = "yason";
      
      sourceProject = "${lisp-project_yason}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-gray-streams} ${lisp_alexandria}";
      name = "lisp_yason-v0.7.6";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
