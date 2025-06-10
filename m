Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uP25L-0001Ny-PJ
	for mharc-qemu-rust@gnu.org; Tue, 10 Jun 2025 12:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1uOz6j-0007yK-Ow
 for qemu-rust@nongnu.org; Tue, 10 Jun 2025 09:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1uOz6e-0007TE-5W
 for qemu-rust@nongnu.org; Tue, 10 Jun 2025 09:33:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749562412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RSXqtXBWmabqZNaGhAVEch3+5fzLdlsgiXpUhNnshS0=;
 b=fIr7ChoDsojO+cBu8Wn43Le8VsiXySRGDmSOz4AYnE0q1hZHHDieqkVzEAFLIbTjblljDN
 pN82IHSDYTIO6ePfhPBSYuO3pMNlMRtgFeIFB/vZCwI8GAr04RialVc7rgLnrl4+TQ+mVA
 TehFmQEtkp1bbobWR72PybRwKuTVpqQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-NKMBUAMaP2WxTvwwMb0sEw-1; Tue, 10 Jun 2025 09:33:31 -0400
X-MC-Unique: NKMBUAMaP2WxTvwwMb0sEw-1
X-Mimecast-MFC-AGG-ID: NKMBUAMaP2WxTvwwMb0sEw_1749562411
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6fab979413fso111499136d6.2
 for <qemu-rust@nongnu.org>; Tue, 10 Jun 2025 06:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749562411; x=1750167211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RSXqtXBWmabqZNaGhAVEch3+5fzLdlsgiXpUhNnshS0=;
 b=CCkns+tHsxv1nAikzL92EVlFT01UiHex2C8gwQt/Vw/Yky4LTLY3Qo/Ox8JoNmbPR/
 o92xkhcS0rqFA/UHEZZhQmvdupEs8GfZvz0O9qtsdKzSwXC3i4lDljOlHOY2SPzTPX46
 k9dpvXkS/tyqpjCuPZZ04TrNSPhvEeq8T6NFlgmE00Kjcr70P8oxKJyopWcARW3q8V/K
 92rZq/G3gqd7ShA9B5Vl9mXtLItC9jLh13vP/bQOcDqt610d1POI7fiRBto74utWenKV
 7J9/gNKuLxhnLPF4uZNHZJlI2wv4/uZmVIhAikMCeBBusNCVj3p+iWpnr+EWNyQHi4vL
 a1Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY3DaIn90LPFiwidiHnAG9qr86E9pyYYlEIneZaGgd4b3Oq1Khi/EJMaYGHDd9j8Kgmx7NTKZgzBs=@nongnu.org
X-Gm-Message-State: AOJu0YzCauGU2ppCCr0XPpvi6+bfwYdxlS5YTt4i1OYDRi9OQMDigZz8
 I6dafwx4CwosaYvsR9YxBxdWGFDyTcttc/rczk+n1nIxjMTAHpLvgkXFTbR69HYzexDZvO4SxGH
 UupKcKc3xXY9FccYcGZE7PfAIXdGfStxvp6D2BKxfNQmLfXo61pvzhl6d4nPf/ocExvh/7stJqn
 ytEAcMLGfYxTdyPtxDJya/k8ivDoypeW66bTY/wnKAPuJP7w==
X-Gm-Gg: ASbGncs7DTZz6xqSE2tUGQWpvsmpVx9soQrQLrQm4cuf7tmUSKwAdVUMPglTissEygZ
 TXJhy8asllCexJo+liWmMLhbDH2ilC+pvL6ddRbCIhP/9xrvM4b+XGtUfdxYKG8Cig/iX1mTB5z
 ohQtNr0sxPyGUj1jnKT3BLqO/fZmTcgUqMh0df
X-Received: by 2002:ad4:5c4c:0:b0:6fa:c5be:dac3 with SMTP id
 6a1803df08f44-6fb08f4f61fmr254505966d6.3.1749562410683; 
 Tue, 10 Jun 2025 06:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYSLTPJ+7/qxAZBKn8MlMuwFnIje6aEXcdxvTRWyHrbuwuignJ7x5Qn2xqlGIIAejOrttK+Pxa/2QoIOzwIsw=
X-Received: by 2002:ad4:5c4c:0:b0:6fa:c5be:dac3 with SMTP id
 6a1803df08f44-6fb08f4f61fmr254505626d6.3.1749562410186; Tue, 10 Jun 2025
 06:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250605101124.367270-1-pbonzini@redhat.com>
 <20250605101124.367270-3-pbonzini@redhat.com>
In-Reply-To: <20250605101124.367270-3-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 10 Jun 2025 17:33:19 +0400
X-Gm-Features: AX0GCFsKoXLKD-1URwHVR9ssAlxpgjXHiZxOR8vklkrbfa4q0CZNuTkT_9wDuvI
Message-ID: <CAMxuvawr=a1RsKXxijZby=1=ru8rNUui7T+Db2P+n5jAeckn3Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] scripts/qapi: add QAPISchemaIfCond.rsgen()
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, armbru@redhat.com, 
 mkletzan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rY2hXdlpyTPJDqhmAVqZgRArsWGX1QhfujNTBI0_SrM_1749562411
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f8ed6f063737bd6c"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Jun 2025 12:42:40 -0400
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jun 2025 13:33:42 -0000

--000000000000f8ed6f063737bd6c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jun 5, 2025 at 2:11=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Generate Rust #[cfg(...)] guards from QAPI 'if' conditions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Link:
> https://lore.kernel.org/r/20210907121943.3498701-15-marcandre.lureau@redh=
at.com
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/qapi/common.py | 16 ++++++++++++++++
>  scripts/qapi/schema.py |  4 ++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index d7c8aa3365c..a8ea5792c11 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -199,6 +199,22 @@ def guardend(name: str) -> str:
>                   name=3Dc_fname(name).upper())
>
>
> +def rsgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -> str:
>

def rsgen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]]) -> str:

to make type checking happy.

+
> +    def cfg(ifcond: Union[str, Dict[str, Any]]):
> +        if isinstance(ifcond, str):
> +            return ifcond
> +        if isinstance(ifcond, list):
> +            return ', '.join([cfg(c) for c in ifcond])
> +        oper, operands =3D next(iter(ifcond.items()))
> +        operands =3D cfg(operands)
> +        return f'{oper}({operands})'
> +
> +    if not ifcond:
> +        return ''
> +    return '#[cfg(%s)]' % cfg(ifcond)
> +
> +
>  def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],
>                 cond_fmt: str, not_fmt: str,
>                 all_operator: str, any_operator: str) -> str:
> diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
> index cbe3b5aa91e..0fb151b5d89 100644
> --- a/scripts/qapi/schema.py
> +++ b/scripts/qapi/schema.py
> @@ -39,6 +39,7 @@
>      docgen_ifcond,
>      gen_endif,
>      gen_if,
> +    rsgen_ifcond,
>  )
>  from .error import QAPIError, QAPISemError, QAPISourceError
>  from .expr import check_exprs
> @@ -65,6 +66,9 @@ def gen_endif(self) -> str:
>      def docgen(self) -> str:
>          return docgen_ifcond(self.ifcond)
>
> +    def rsgen(self) -> str:
> +        return rsgen_ifcond(self.ifcond)
> +
>      def is_present(self) -> bool:
>          return bool(self.ifcond)
>
> --
> 2.49.0
>
>

--000000000000f8ed6f063737bd6c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi</div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 5, 20=
25 at 2:11=E2=80=AFPM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.c=
om">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</=
a>&gt;<br>
<br>
Generate Rust #[cfg(...)] guards from QAPI &#39;if&#39; conditions.<br>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
Link: <a href=3D"https://lore.kernel.org/r/20210907121943.3498701-15-marcan=
dre.lureau@redhat.com" rel=3D"noreferrer" target=3D"_blank">https://lore.ke=
rnel.org/r/20210907121943.3498701-15-marcandre.lureau@redhat.com</a><br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
---<br>
=C2=A0scripts/qapi/common.py | 16 ++++++++++++++++<br>
=C2=A0scripts/qapi/schema.py |=C2=A0 4 ++++<br>
=C2=A02 files changed, 20 insertions(+)<br>
<br>
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
index d7c8aa3365c..a8ea5792c11 100644<br>
--- a/scripts/qapi/common.py<br>
+++ b/scripts/qapi/common.py<br>
@@ -199,6 +199,22 @@ def guardend(name: str) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 name=3Dc_fna=
me(name).upper())<br>
<br>
<br>
+def rsgen_ifcond(ifcond: Union[str, Dict[str, Any]]) -&gt; str:<br></block=
quote><div><br></div><div>def rsgen_ifcond(ifcond: Optional[Union[str, Dict=
[str, Any]]]) -&gt; str:</div><div><br></div><div>to make type checking=C2=
=A0happy.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
+<br>
+=C2=A0 =C2=A0 def cfg(ifcond: Union[str, Dict[str, Any]]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(ifcond, str):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ifcond<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(ifcond, list):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;, &#39;.join([cfg(c)=
 for c in ifcond])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 oper, operands =3D next(iter(ifcond.items()))<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 operands =3D cfg(operands)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return f&#39;{oper}({operands})&#39;<br>
+<br>
+=C2=A0 =C2=A0 if not ifcond:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
+=C2=A0 =C2=A0 return &#39;#[cfg(%s)]&#39; % cfg(ifcond)<br>
+<br>
+<br>
=C2=A0def gen_ifcond(ifcond: Optional[Union[str, Dict[str, Any]]],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cond_fmt: str, not_=
fmt: str,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 all_operator: str, =
any_operator: str) -&gt; str:<br>
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py<br>
index cbe3b5aa91e..0fb151b5d89 100644<br>
--- a/scripts/qapi/schema.py<br>
+++ b/scripts/qapi/schema.py<br>
@@ -39,6 +39,7 @@<br>
=C2=A0 =C2=A0 =C2=A0docgen_ifcond,<br>
=C2=A0 =C2=A0 =C2=A0gen_endif,<br>
=C2=A0 =C2=A0 =C2=A0gen_if,<br>
+=C2=A0 =C2=A0 rsgen_ifcond,<br>
=C2=A0)<br>
=C2=A0from .error import QAPIError, QAPISemError, QAPISourceError<br>
=C2=A0from .expr import check_exprs<br>
@@ -65,6 +66,9 @@ def gen_endif(self) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0def docgen(self) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return docgen_ifcond(self.ifcond)<br>
<br>
+=C2=A0 =C2=A0 def rsgen(self) -&gt; str:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return rsgen_ifcond(self.ifcond)<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def is_present(self) -&gt; bool:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return bool(self.ifcond)<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--000000000000f8ed6f063737bd6c--


