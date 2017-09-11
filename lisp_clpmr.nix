
{ buildLispPackage, stdenv, fetchurl, lisp-project_clpmr, 
   lisp_cl-ppcre, lisp_mime4cl, lisp_net4cl, lisp_sclf, lisp_smtp4cl,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_mime4cl lisp_net4cl lisp_sclf lisp_smtp4cl  ];
      inherit stdenv;
      systemName = "clpmr";
      
      sourceProject = "${lisp-project_clpmr}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_mime4cl} ${lisp_net4cl} ${lisp_sclf} ${lisp_smtp4cl}";
      name = "lisp_clpmr-20150207T212625";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
