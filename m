Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uP23u-00016q-VN
	for mharc-qemu-rust@gnu.org; Tue, 10 Jun 2025 12:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1uOyzt-000792-Iz
 for qemu-rust@nongnu.org; Tue, 10 Jun 2025 09:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1uOyzm-0006g5-KU
 for qemu-rust@nongnu.org; Tue, 10 Jun 2025 09:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749561986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TZ8YbzTFpdhd6WiOhudM2Tuhugtqn6d4bA9UVq6kugI=;
 b=Xic7H4WyBdpaaW+ofGBtzxXTa+S5IOJGSprv7FxG/5UThp+znMRlOLowny0jIG2MBLAab3
 BcZpIj4WUcB5X8AjPPKSMUrB8SMCxDoWHk1p/7pK/PQc7oNpAcetLH9LqkB2Nroo5s8oKD
 kub6uGWqW8J9r+4xpKAUCtg3nimAN2E=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-YyI7w9-pMti7c0IGKhmO5w-1; Tue, 10 Jun 2025 09:26:25 -0400
X-MC-Unique: YyI7w9-pMti7c0IGKhmO5w-1
X-Mimecast-MFC-AGG-ID: YyI7w9-pMti7c0IGKhmO5w_1749561984
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6fb1f84a448so18116276d6.0
 for <qemu-rust@nongnu.org>; Tue, 10 Jun 2025 06:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561984; x=1750166784;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TZ8YbzTFpdhd6WiOhudM2Tuhugtqn6d4bA9UVq6kugI=;
 b=KRFCXxFmoR6X0XUWyZAK6Nel7Kn3vY1jL9UzyFq1+yJKRzNSHlsD5Uv8m0IirVALAW
 FVF/2KvwcLA/aCsVoqOOBNov7TnTmaBie68ki3915CGiyqns70aKDaYlXk7DanWMLUEQ
 33dhpA5b15Gcm9YZ6vv6FUGUJXZnYID9yho+0f+YlNsmXjSApOspMz6XRi19atcY+Zr2
 BhXaS8gtk/w2hY0U339FRb6e28ZYkzoUprgItlyjDFlTdChlJDm6DGxEJ7Cqpuftz7QD
 /zkInnIa6ndAQXg0ETu0oiWkcSHJrlOEHwxlr1qaMCmkPBUXg2c7PPaNr8qNqJXnDEMP
 dvzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtgI9Egwaae/kDuy8AXhgMUxM5gDjwFDOtHIPXgDscdgesVbx6vGy+ChyeHHWcxpJXA6TqQbSqtVY=@nongnu.org
X-Gm-Message-State: AOJu0YzXkOLUjGkfMzDzWoIelKYsQV30lc1Kr268/9jmhIsj4/IbcIr5
 k8HCxCpKn4gf5iBVCcVFU+6iw+z5G4f9fT/L9Re3uTJmKeGAET2KRLOegHujrJ15XhV1RbQh0ac
 ux0KlrvFdKiys0MFfNwJKfXPaMCyAXY6TCAaEzHeC/Um3yTzsyMVXbya1M5DqqfXeNujKsDDv1g
 UkjJv2hWSr8gQh7jjpBT07tQz419uy1A==
X-Gm-Gg: ASbGncu7GoV+/5Wpdow90sWG9qWT04FuotV5z3rM+EaBxr4FGGRKVuax7WEqYn4Bs3/
 cHjxDxjuzo9vCBURg3eUM6sVFjhQcseU7+8aVdaHpPTC3t+U+Fta7kYD6q2DvO5eZ0uBKopavEG
 0LvevA86LMPh067DC0Uapy01WpZXIgOO72BNjD
X-Received: by 2002:a05:6214:242e:b0:6fa:cb05:b44c with SMTP id
 6a1803df08f44-6fb08f4314fmr266826806d6.3.1749561984292; 
 Tue, 10 Jun 2025 06:26:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG33ocxkZEMglLzN5LY6ffp83zf1HHmc9QPJ1W61gb+CYFBfzhOluCj4vzs9SClPZByqDMfkiWzoQkPajiv1Q=
X-Received: by 2002:a05:6214:242e:b0:6fa:cb05:b44c with SMTP id
 6a1803df08f44-6fb08f4314fmr266826216d6.3.1749561983816; Tue, 10 Jun 2025
 06:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250605101124.367270-1-pbonzini@redhat.com>
 <20250605101124.367270-2-pbonzini@redhat.com>
In-Reply-To: <20250605101124.367270-2-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 10 Jun 2025 17:26:12 +0400
X-Gm-Features: AX0GCFvE64xeikhVCZx9sJM6BU5Q1IMeiXm2InfyBL5Zwgr9Ien68vArHYlPu24
Message-ID: <CAMxuvayD+KvQTVWv+MyU8gmxLgwDF3p1ahiY+6WLvHJndJTXxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: make TryFrom macro more resilient
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org, armbru@redhat.com, 
 mkletzan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rRALKPTBQmV803lWus6iHiC7GJW1SUiaFux396WUtJ4_1749561984
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000008ee651063737a4da"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 10 Jun 2025 12:42:39 -0400
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
X-List-Received-Date: Tue, 10 Jun 2025 13:26:38 -0000

--0000000000008ee651063737a4da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 2:11=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com> =
wrote:

> If the enum includes values such as "Ok", "Err", or "Error", the TryInto
> macro can cause errors.  Be careful and qualify identifiers with the full
> path, or in the case of TryFrom<>::Error do not use the associated type
> at all.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  rust/qemu-api-macros/src/lib.rs | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/rust/qemu-api-macros/src/lib.rs b/rust/qemu-api-macros/src/
> lib.rs
> index 103470785e3..c18bb4e036f 100644
> --- a/rust/qemu-api-macros/src/lib.rs
> +++ b/rust/qemu-api-macros/src/lib.rs
> @@ -203,8 +203,8 @@ fn derive_tryinto_body(
>      Ok(quote! {
>          #(const #discriminants: #repr =3D #name::#discriminants as #repr=
;)*;
>          match value {
> -            #(#discriminants =3D> Ok(#name::#discriminants),)*
> -            _ =3D> Err(value),
> +            #(#discriminants =3D>
> core::result::Result::Ok(#name::#discriminants),)*
> +            _ =3D> core::result::Result::Err(value),
>          }
>      })
>  }
> @@ -236,7 +236,8 @@ pub const fn from_bits(value: #repr) -> Self {
>          impl core::convert::TryFrom<#repr> for #name {
>              type Error =3D #repr;
>
> -            fn try_from(value: #repr) -> Result<Self, Self::Error> {
> +            #[allow(ambiguous_associated_items)]
> +            fn try_from(value: #repr) -> Result<Self, #repr> {
>                  #body
>              }
>          }
> --
> 2.49.0
>
>

--0000000000008ee651063737a4da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 5, =
2025 at 2:11=E2=80=AFPM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat=
.com">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">If the enum includes values such as &quot;Ok&quot;=
, &quot;Err&quot;, or &quot;Error&quot;, the TryInto<br>
macro can cause errors.=C2=A0 Be careful and qualify identifiers with the f=
ull<br>
path, or in the case of TryFrom&lt;&gt;::Error do not use the associated ty=
pe<br>
at all.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0rust/qemu-api-macros/src/<a href=3D"http://lib.rs" rel=3D"noreferrer"=
 target=3D"_blank">lib.rs</a> | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/rust/qemu-api-macros/src/<a href=3D"http://lib.rs" rel=3D"nore=
ferrer" target=3D"_blank">lib.rs</a> b/rust/qemu-api-macros/src/<a href=3D"=
http://lib.rs" rel=3D"noreferrer" target=3D"_blank">lib.rs</a><br>
index 103470785e3..c18bb4e036f 100644<br>
--- a/rust/qemu-api-macros/src/<a href=3D"http://lib.rs" rel=3D"noreferrer"=
 target=3D"_blank">lib.rs</a><br>
+++ b/rust/qemu-api-macros/src/<a href=3D"http://lib.rs" rel=3D"noreferrer"=
 target=3D"_blank">lib.rs</a><br>
@@ -203,8 +203,8 @@ fn derive_tryinto_body(<br>
=C2=A0 =C2=A0 =C2=A0Ok(quote! {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#(const #discriminants: #repr =3D #name::=
#discriminants as #repr;)*;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0match value {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #(#discriminants =3D&gt; Ok(#nam=
e::#discriminants),)*<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D&gt; Err(value),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #(#discriminants =3D&gt; core::r=
esult::Result::Ok(#name::#discriminants),)*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D&gt; core::result::Result::=
Err(value),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0})<br>
=C2=A0}<br>
@@ -236,7 +236,8 @@ pub const fn from_bits(value: #repr) -&gt; Self {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0impl core::convert::TryFrom&lt;#repr&gt; =
for #name {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0type Error =3D #repr;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn try_from(value: #repr) -&gt; =
Result&lt;Self, Self::Error&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[allow(ambiguous_associated_ite=
ms)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn try_from(value: #repr) -&gt; =
Result&lt;Self, #repr&gt; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#body<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000008ee651063737a4da--


