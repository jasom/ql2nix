
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-yaml, 
   lisp_alexandria, lisp_cl-libyaml, lisp_cl-ppcre, lisp_parse-number,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-libyaml lisp_cl-ppcre lisp_parse-number  ];
      inherit stdenv;
      systemName = "cl-yaml";
      
      sourceProject = "${lisp-project_cl-yaml}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-libyaml} ${lisp_cl-ppcre} ${lisp_parse-number}";
      name = "lisp_cl-yaml-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
