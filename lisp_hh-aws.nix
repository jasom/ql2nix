
{ buildLispPackage, stdenv, fetchurl, lisp-project_hh-aws, 
   lisp_s-xml, lisp_ironclad, lisp_drakma,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_s-xml lisp_ironclad lisp_drakma  ];
      inherit stdenv;
      systemName = "hh-aws";
      
      sourceProject = "${lisp-project_hh-aws}";
      patches = [];
      lisp_dependencies = "${lisp_s-xml} ${lisp_ironclad} ${lisp_drakma}";
      name = "lisp_hh-aws-20150804-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
