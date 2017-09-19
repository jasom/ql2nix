
{ buildLispPackage, stdenv, fetchurl, lisp-project_gzip-stream, 
   lisp_flexi-streams, lisp_salza2,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_salza2  ];
      inherit stdenv;
      systemName = "gzip-stream";
      
      sourceProject = "${lisp-project_gzip-stream}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_salza2}";
      name = "lisp_gzip-stream_0.2.8";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
