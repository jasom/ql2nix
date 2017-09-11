
{ buildLispPackage, stdenv, fetchurl, lisp-project_ec2, 
   lisp_drakma, lisp_ironclad, lisp_s-base64, lisp_s-xml,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_ironclad lisp_s-base64 lisp_s-xml  ];
      inherit stdenv;
      systemName = "ec2";
      
      sourceProject = "${lisp-project_ec2}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_ironclad} ${lisp_s-base64} ${lisp_s-xml}";
      name = "lisp_ec2-20120909-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
