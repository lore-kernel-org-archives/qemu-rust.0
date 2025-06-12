Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uPcXZ-00071I-3A
	for mharc-qemu-rust@gnu.org; Thu, 12 Jun 2025 03:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPcXX-00070o-61
 for qemu-rust@nongnu.org; Thu, 12 Jun 2025 03:39:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1uPcXV-0006PA-TQ
 for qemu-rust@nongnu.org; Thu, 12 Jun 2025 03:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749713996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jyfclqkv9g5I5cSR+ECGEHSp27JRi/Dx2MjH1UDDGhQ=;
 b=WWS5zd0ob1PCukDWXlFD6L6MqH0JcS3YF8XNXAIe/7uiZ6DjfffFgltXrs9S7eiM2dBW8J
 gXcnKNBjFw1jlhit4VgPkLM1V6ZM88K6cT3NPMRAQ11wiie3L3pIOOuyNnocUDNALcwhza
 bCS3JK9hU3o4EFa9MO4eDE8gWqa/4GA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-QMX10YinOjSr5xFhFpHrQw-1; Thu, 12 Jun 2025 03:39:55 -0400
X-MC-Unique: QMX10YinOjSr5xFhFpHrQw-1
X-Mimecast-MFC-AGG-ID: QMX10YinOjSr5xFhFpHrQw_1749713994
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a4edf5bb4dso368416f8f.0
 for <qemu-rust@nongnu.org>; Thu, 12 Jun 2025 00:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749713993; x=1750318793;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jyfclqkv9g5I5cSR+ECGEHSp27JRi/Dx2MjH1UDDGhQ=;
 b=PhbggRzZmtiARudjONu2ttKfZHYKqKkQSvdoEqziObqHUDIL0emm0dZzQM6y3GAMCX
 eXasQbZ4CFjgKrV/Ct2ROXNVjTgY1WTw8UgDVLLqHbqo5UVHS4HUlu6ebKGl6seoUVq8
 LZ/ihFu3KLR8SR8p6ve7pBbvzvq4G/sjOaT7y35xkOlCtjd4nua+dmqXB98TNGQgS3Qi
 pse4ACj20p4ysxjCnTqcNPFq6sVqOMosGRmgd6nV6K2295zTmm8fnbBCHmsnzFsWON63
 21NUuBxtuNVwYNITfooeA/AvSvJYF/M00IlrlmMXr5FkqDDZ7pK9n5ucT/mnmLo/QWZq
 ksZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2GzsovBNBYreyI/P78r/ZJrteCw6AOOtvP9IdrJJF9m9RjcYYAuwD0iZ2lLkackrGlr3WCsFOHhQ=@nongnu.org
X-Gm-Message-State: AOJu0YxgqhrTFGr2hOUXO4NTe0ZCkZkxEYcYDOJtJ3tZTQVo6OBKu8P2
 +pwVx239deGkuGf60HBjAH8uBtKT3U6R2RqC1OZO4pHhUhILXReyFHqy7hTDRvpBEKjIDLawEwi
 DchQcWtIpd5hzaleUkvwWiETAkoHm7Fq2qdlNDV7zDwSEEOBgOf5xxN7QH6dfg8a7Ask+da0Zli
 ZhakbD2kAYuYmIlKsQjjBBNgZRKocQkKh5P3NFeA==
X-Gm-Gg: ASbGncuBMZvVKSqczdfNqxchdMuXcoLNh2F5dkGN1UrRmyR5Xs4DH8/2D7bJj8Vz7gP
 gdu7KHil/Zqtxv/kcST1OI1Nhq9gxWOajszx4rtrdg7IeFqTwOLx6goJC7UbvAia+gzMBqqaAJF
 KwFg==
X-Received: by 2002:a5d:64e9:0:b0:3a4:f7af:db9c with SMTP id
 ffacd0b85a97d-3a558a43b5emr4944225f8f.59.1749713992767; 
 Thu, 12 Jun 2025 00:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2IVnGMJCnwsL7wsPIX3aIGjP6OxrKIOmkgg6ZR2+08XS10UasBnXgVNDDmescJyDhnaK13nwxXAPAQ2LqLJ4=
X-Received: by 2002:a5d:64e9:0:b0:3a4:f7af:db9c with SMTP id
 ffacd0b85a97d-3a558a43b5emr4944208f8f.59.1749713992446; Thu, 12 Jun 2025
 00:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250610202110.2243-1-shentey@gmail.com>
 <20250610202110.2243-2-shentey@gmail.com>
 <CAAjaMXbtcyB3J3AvGh8ZW3MSi41uMaE+TkZwipCs5pg6wvYJ=w@mail.gmail.com>
 <CABgObfYgoYBJmZjin_Wj8JeEviFMM+vFa_QX_8Np+1n9apq4kw@mail.gmail.com>
 <CAAjaMXZ5S7GUPmhwxsyuVmF4tvUh3vgjnK8OLKv-A+h7JCPqBA@mail.gmail.com>
 <9C43F9B8-6A5A-40EA-88B4-C5B8B17B9F5A@gmail.com>
In-Reply-To: <9C43F9B8-6A5A-40EA-88B4-C5B8B17B9F5A@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jun 2025 09:39:41 +0200
X-Gm-Features: AX0GCFu8W0jpAtL1sa6todOY1hM005Tk7scgUnuFa-eYsDT31POjL87RPcqTo3I
Message-ID: <CABgObfbJbAg=tJ5CzUntexKFnfQzBKteh2jK4pebQfWY86B-Yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust/qemu-api: Add initial logging support based
 on C API
To: Bernhard Beschow <shentey@gmail.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WO7HYt0ND_3i1tFXH0QyO6H4apkbmUainuhAmqvbrew_1749713994
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000fa914b06375b08fc"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 12 Jun 2025 07:39:59 -0000

--000000000000fa914b06375b08fc
Content-Type: text/plain; charset="UTF-8"

Il gio 12 giu 2025, 09:37 Bernhard Beschow <shentey@gmail.com> ha scritto:

> So the idea is to have a log_mask_ln! macro instead, since there isn't
> really a point for a macro that doesn't add `\n` at the end. Correct?
>

Yes, or both.

Paolo

>

--000000000000fa914b06375b08fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 12 giu 2025, 09:37 Bernha=
rd Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">S=
o the idea is to have a log_mask_ln! macro instead, since there isn&#39;t r=
eally a point for a macro that doesn&#39;t add `\n` at the end. Correct?<br=
></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes=
, or both.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><d=
iv dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div></div>

--000000000000fa914b06375b08fc--


