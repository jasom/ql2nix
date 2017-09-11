
{ buildLispPackage, stdenv, fetchurl, lisp-project_ryeboy, 
   lisp_alexandria, lisp_protobuf, lisp_prove-asdf, lisp_usocket,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_protobuf lisp_prove-asdf lisp_usocket  ];
      inherit stdenv;
      systemName = "ryeboy";
      
      sourceProject = "${lisp-project_ryeboy}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_protobuf} ${lisp_prove-asdf} ${lisp_usocket}";
      name = "lisp_ryeboy-20150302-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
