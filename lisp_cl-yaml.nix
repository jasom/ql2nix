
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-yaml, 
   lisp_parse-number, lisp_cl-ppcre, lisp_cl-libyaml,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parse-number lisp_cl-ppcre lisp_cl-libyaml  ];
      inherit stdenv;
      systemName = "cl-yaml";
      
      sourceProject = "${lisp-project_cl-yaml}";
      patches = [];
      lisp_dependencies = "${lisp_parse-number} ${lisp_cl-ppcre} ${lisp_cl-libyaml}";
      name = "lisp_cl-yaml-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
