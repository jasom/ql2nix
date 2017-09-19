
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-langutils, 
   lisp_stdutils, lisp_s-xml-rpc,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_stdutils lisp_s-xml-rpc  ];
      inherit stdenv;
      systemName = "langutils";
      
      sourceProject = "${lisp-project_cl-langutils}";
      patches = [];
      lisp_dependencies = "${lisp_stdutils} ${lisp_s-xml-rpc}";
      name = "lisp_langutils-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
