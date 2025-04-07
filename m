Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1u1hGW-0003VQ-Er
	for mharc-qemu-rust@gnu.org; Mon, 07 Apr 2025 03:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u1hGU-0003Rp-AX
 for qemu-rust@nongnu.org; Mon, 07 Apr 2025 03:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1u1hGS-0005W7-Gb
 for qemu-rust@nongnu.org; Mon, 07 Apr 2025 03:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744012286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ePL7yGI/np6XrLPSJq8DxmtQ+ASHn4hRgL9iYhqw+YA=;
 b=X0TGU0FbI2S+4NXmOKs0MTwRSEfdIntN0AKAE19BTcrA6yaCIIUPfn+H5I6NsEdxzd5/K8
 /DbefQS4zmqS/BY0IiJ7cOFFCazxM+EY3di8kxTxNHmmAUjj+xnPb5kwsLnnvnbEXLoFnj
 p8+vi+RfjETsoySq1O+PlURbdX1Jg9o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-7m5IoMNMMGCHz3tFlFut8g-1; Mon, 07 Apr 2025 03:51:25 -0400
X-MC-Unique: 7m5IoMNMMGCHz3tFlFut8g-1
X-Mimecast-MFC-AGG-ID: 7m5IoMNMMGCHz3tFlFut8g_1744012284
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4394c489babso19830235e9.1
 for <qemu-rust@nongnu.org>; Mon, 07 Apr 2025 00:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744012284; x=1744617084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePL7yGI/np6XrLPSJq8DxmtQ+ASHn4hRgL9iYhqw+YA=;
 b=W5P2DjgAWFQRImzBkhzJGSCjy1U2I3AbGyMqRGCkWiU5zs9DAfIQG7CU5ELXdpMd4l
 IUbh8e+dlaqjUdDUbNunFmh+6jNwxQE1xm59PWxDaw25JXxMqtdudGnMkLJUlmXSUQvC
 KJydzQXmy6Xl7crjUYMfdwaDjHkZlg/VQ1AiX79o+XanEU20+7s0SSEyYmPUQp9vffsi
 yEGdm0KhsHs0hY9/3LSnzhi6L4QJgnMz8sNDgUkg4zf0TvMOZLtW74g8nAUrjbgyinH7
 D235Kk3SC6KY7ePzxQrFYsvzaBbr2okZZXRzvx8sSvds7fn9hybi2SeCKtE0wG/H1544
 kS2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9k28GER5Y0clYAFrJ6zfBeNHx33SZJtVN8EzuNt6BPbRd/plt7o5bxfp42ADuoMELEMlggMXgqi8=@nongnu.org
X-Gm-Message-State: AOJu0YyM006ZHPXCGErM5hT/pqX0y1qlVbSBIZ56iA/2ZZ4LrVe9Zk00
 5lOeSL4F4oq1ySA4NjUZz2woe7AAdKaD/VeoYmKAhFTFkroa97Ss2k6ybjs/iLuCrC/qjlBGHjo
 7/e372lil6asyqOTWOkIgfaLf9eGX/6RJWVloGzwRPfqUjbTADRGJeyfHlIkFqL5bV/36fV/NSQ
 prFPtSaC7A0RrPj5XSfe99YsT4Pw==
X-Gm-Gg: ASbGncsWXW+EcvpCrtOeTYz6+Ae1p+XZm0PSSKaA7PNxWVrfBzbR/84CDi0fhIt9dz3
 CKymnh+/zm0EWxmnjcMYbGoSPaNHVnWTYEBq15HiIXeW/GhpCOSR45lImJ4frtEt4dHkwuTo=
X-Received: by 2002:a05:600c:4705:b0:43d:53c:1ad6 with SMTP id
 5b1f17b1804b1-43ecfa02754mr74353725e9.26.1744012284194; 
 Mon, 07 Apr 2025 00:51:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr7TQILZKlXujmHDTUJbd6BDatx6QazSGekGPH+q/TeHB3h7aemAbTkrVDtflGZtsUhDiopD14zN23CS9AVQc=
X-Received: by 2002:a05:600c:4705:b0:43d:53c:1ad6 with SMTP id
 5b1f17b1804b1-43ecfa02754mr74353575e9.26.1744012283874; Mon, 07 Apr 2025
 00:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250405100603.253421-1-pbonzini@redhat.com>
 <Z/OAtJA8DUIsmuep@intel.com>
In-Reply-To: <Z/OAtJA8DUIsmuep@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 7 Apr 2025 09:51:11 +0200
X-Gm-Features: ATxdqUH3Do-VOiv3Gmg_4vTAALdRnwUTePkmt3GN9WQt1FCbJvtAk1Wj8Ys8P9I
Message-ID: <CABgObfYtbF6btNL_sLWtE679j_N4rydSP89tpz2w6tr9CRnCpg@mail.gmail.com>
Subject: Re: [PATCH preview 0/3] rust: update build system for Meson 1.8.0
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p1u4IB3bDbLhIExCsJsncXjGdweWMVHX2dkAhrNAvqY_1744012284
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.659,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Mon, 07 Apr 2025 07:51:31 -0000

On Mon, Apr 7, 2025 at 9:17=E2=80=AFAM Zhao Liu <zhao1.liu@intel.com> wrote=
:
> On Sat, Apr 05, 2025 at 12:06:00PM +0200, Paolo Bonzini wrote:
> > Date: Sat,  5 Apr 2025 12:06:00 +0200
> > From: Paolo Bonzini <pbonzini@redhat.com>
> > Subject: [PATCH preview 0/3] rust: update build system for Meson 1.8.0
> > X-Mailer: git-send-email 2.49.0
> >
> > Meson 1.7.0 and 1.8.0 include improved support for Rust, namely:
> > * support for "objects" in Rust executables
> > * support for doctest targets
>
> Is there a patch missing to actually bump the required meson version up
> to v1.8.0?

Yes, because there has not been a 1.8.0 release yet (or even an -rc).

Paolo


