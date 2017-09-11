
{ buildLispPackage, stdenv, fetchurl, lisp-project_s-xml-rpc, 
   lisp_s-xml,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_s-xml  ];
      inherit stdenv;
      systemName = "s-xml-rpc";
      
      sourceProject = "${lisp-project_s-xml-rpc}";
      patches = [];
      lisp_dependencies = "${lisp_s-xml}";
      name = "lisp_s-xml-rpc-20101006-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
