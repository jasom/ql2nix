
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tiled, 
   lisp_xmls, lisp_split-sequence, lisp_parse-float, lisp_nibbles, lisp_cl-json, lisp_cl-base64, lisp_chipz, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_xmls lisp_split-sequence lisp_parse-float lisp_nibbles lisp_cl-json lisp_cl-base64 lisp_chipz lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-tiled";
      
      sourceProject = "${lisp-project_cl-tiled}";
      patches = [];
      lisp_dependencies = "${lisp_xmls} ${lisp_split-sequence} ${lisp_parse-float} ${lisp_nibbles} ${lisp_cl-json} ${lisp_cl-base64} ${lisp_chipz} ${lisp_alexandria}";
      name = "lisp_cl-tiled-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
