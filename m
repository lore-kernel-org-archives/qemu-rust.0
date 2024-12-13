Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tM3nf-0004E8-Sl
	for mharc-qemu-rust@gnu.org; Fri, 13 Dec 2024 06:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tM3nR-00048s-NF
 for qemu-rust@nongnu.org; Fri, 13 Dec 2024 06:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tM3nJ-0000jW-FQ
 for qemu-rust@nongnu.org; Fri, 13 Dec 2024 06:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734089111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1N+aZYuNIMt+bY5jVpnrGhR8IijEESQefd14Y8VT6KQ=;
 b=cbGTLibxv79jmhFiFSGw0hLLKX+OAgfQQQow3zzc/ZFBRGdemk3og08lE+wrzpY5q4m5Dw
 4sT01JaKXaioSzTKacSR4PVb7OSvZg+A4j4bJrL4kN5YHucDJdwu31jtQKxkpGmsH7P251
 6Kj/7VgyihAPWeZbJLPlhA2j+zWjEAY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504-yGaUDNNQPqGTYgTN9WWcpg-1; Fri, 13 Dec 2024 06:25:07 -0500
X-MC-Unique: yGaUDNNQPqGTYgTN9WWcpg-1
X-Mimecast-MFC-AGG-ID: yGaUDNNQPqGTYgTN9WWcpg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38639b4f19cso1086675f8f.0
 for <qemu-rust@nongnu.org>; Fri, 13 Dec 2024 03:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734089105; x=1734693905;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1N+aZYuNIMt+bY5jVpnrGhR8IijEESQefd14Y8VT6KQ=;
 b=EHhW2PeXxOin6e9oijzun1k58qTS1GeWiWhlEvsVSA/XSTbP19i8cLMkkt9HaF37NK
 U7pf8zwcp8k8DHkrLK3VYeGuI1XWYUVwYh1aFQWTlm+DZ08pvJqCojZEgDcBgi4uFGnP
 yOhFSQoIBcIpY9Vx5sb86MjlZu5kHhgalL+cQgSLGDgbem0YCd3oFcxQrjEc0w+BrXsc
 /nCrlpGlgC8YcY0JVGUOUfPEzH6nTr2ijqf3x6rxZQUS+uelUPnI0VCXn95bxDam8ogm
 xWhfpJhPt0ipMlJiUFqpKo42k1T6cw8RrNxJwoj62JJnrhfxdiIlp22S6owQrxj/vsTg
 Rxcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcY4WmlDa8FBKRzvW9crh4pafVmKJfrNSF0GqEyEu1fv4dmOxt9MIweXN3jFrm767P3VG5WjfiY+c=@nongnu.org
X-Gm-Message-State: AOJu0YymtJGbWuc5qNbJAF+NiowHxz5MC9V/AjWoZPxOAE44Rl7Ztdyi
 /GztdUgCexD0RJKnObDbOOiIgm3QudO+dvc7hIqgHeTU5YDRixZ+RApvIUjc4XD5MLng3xjulhz
 62MWhg4QNzal6EroenF7J2iDTSss0xLqogXMZCvTOta+laGuLpCMj6PVXHFPZk6NvDSm+iciRBy
 ySlDVvRoPdDfqgadb+7ytY/J68/GXIPRc7Dg==
X-Gm-Gg: ASbGncsAcYqswfqkPRdUytX39xQ7dQo+RfOLIf5IMwiyjdk3qrj/gj2oQmAevRF0erJ
 xX3pxWxpO8xraZGJtcjDIRcC/+yswJgQTrSka6g==
X-Received: by 2002:a5d:64a9:0:b0:385:fb34:d5a0 with SMTP id
 ffacd0b85a97d-38880ae140cmr1807755f8f.29.1734089105297; 
 Fri, 13 Dec 2024 03:25:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9WAVNzuPvLGPPwTNfmY1+QhvWNDm/MHqeM6dV95fcacfIOaKveU8JF8Pq2TDE2B4d4h9hHt5ZhFKhTn66Bfw=
X-Received: by 2002:a5d:64a9:0:b0:385:fb34:d5a0 with SMTP id
 ffacd0b85a97d-38880ae140cmr1807731f8f.29.1734089104965; Fri, 13 Dec 2024
 03:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20241209123717.99077-1-pbonzini@redhat.com>
 <20241209123717.99077-20-pbonzini@redhat.com>
 <Z1qyeThRA8yJMMoM@intel.com> <a0bdbf2a-8430-480e-bc56-e8a4875dd577@redhat.com>
 <Z1v8NhJb/xBp/K2D@intel.com>
In-Reply-To: <Z1v8NhJb/xBp/K2D@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 13 Dec 2024 12:24:53 +0100
Message-ID: <CABgObfZb67eLK=kwJXWK6V=+5wB41NuPchbDBERdHtLWN-4ThA@mail.gmail.com>
Subject: Re: [PATCH 19/26] rust: rename qemu-api modules to follow C code a
 bit more
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org, 
 Junjie Mao <junjie.mao@hotmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: miybWBgxzVlWp96K7kvsCuECycungZvd-wFHFaFLJkg_1734089106
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000001c6a91062925153e"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 13 Dec 2024 11:25:29 -0000

--0000000000001c6a91062925153e
Content-Type: text/plain; charset="UTF-8"

Il ven 13 dic 2024, 10:01 Zhao Liu <zhao1.liu@intel.com> ha scritto:

> I found vmstate_array_of_pointer_to_struct missed a `info` field, and I
> could submit a patch to fix this nit next week (along with other cleanup
> you and other miantainers suggested for HPET).
>

I wouldn't worry too much about VMState, it's not in its final form and
anything that isn't needed to pass qtests can wait.

Paolo


> for which my idea is to implement a trait on
> > types to retrieve a basic VMStateField (for example something like
> > vmstate_uint32 would become an implementation of the VMState trait on
> u32).
>
> This makes sense.
>
> > Then you'd write something like "vmstate_of!(Type,
> > field).with_version_id(2)" (i.e. vmstate_of retrieves the basic field and
> > fills in the offset, then you apply more changes on top).  But that may
> take
> > a while, and I think it cannot be done without the const_refs_to_static
> > feature, which is only stable in 1.83.0.
>
> I also like this idea!
>
> Thanks,
> Zhao
>
>
>

--0000000000001c6a91062925153e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il ven 13 dic 2024, 10:01 Zhao L=
iu &lt;<a href=3D"mailto:zhao1.liu@intel.com">zhao1.liu@intel.com</a>&gt; h=
a scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I fou=
nd vmstate_array_of_pointer_to_struct missed a `info` field, and I<br>
could submit a patch to fix this nit next week (along with other cleanup<br=
>
you and other miantainers suggested for HPET).<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">I wouldn&#39;t worry too much=
 about VMState, it&#39;s not in its final form and anything that isn&#39;t =
needed to pass qtests can wait.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt; for which my idea is to implement a trait on<br>
&gt; types to retrieve a basic VMStateField (for example something like<br>
&gt; vmstate_uint32 would become an implementation of the VMState trait on =
u32).<br>
<br>
This makes sense.<br>
<br>
&gt; Then you&#39;d write something like &quot;vmstate_of!(Type,<br>
&gt; field).with_version_id(2)&quot; (i.e. vmstate_of retrieves the basic f=
ield and<br>
&gt; fills in the offset, then you apply more changes on top).=C2=A0 But th=
at may take<br>
&gt; a while, and I think it cannot be done without the const_refs_to_stati=
c<br>
&gt; feature, which is only stable in 1.83.0.<br>
<br>
I also like this idea!<br>
<br>
Thanks,<br>
Zhao<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000001c6a91062925153e--


