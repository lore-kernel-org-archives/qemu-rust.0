Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tuE8v-00042A-SA
	for mharc-qemu-rust@gnu.org; Mon, 17 Mar 2025 13:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuE8p-0003yX-Mx
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 13:20:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1tuE8h-0000hi-Fj
 for qemu-rust@nongnu.org; Mon, 17 Mar 2025 13:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742232031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pAkgqrelAe4YIX3NAm9ZTxDn/cN/Kq4AFcPnu3EncxM=;
 b=aOEesSgQ61RaOZwKXfy8pYR/mjMgQIRiiWp9/UG+bFly75fNTDp+D9bz7R6+HGgMIR+qf7
 1rugzScr9Lg6++PPVbOaPj/P35s331ATNUn8pQANL2XOvPzzZ7ytE3OF3sWDnDYivOQZX2
 V/Jz1MHrnLHmmJQOgth20A51TJKnk4s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-UmqEhMqLNVSlg1UvkSdclw-1; Mon, 17 Mar 2025 13:20:30 -0400
X-MC-Unique: UmqEhMqLNVSlg1UvkSdclw-1
X-Mimecast-MFC-AGG-ID: UmqEhMqLNVSlg1UvkSdclw_1742232029
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43cf44b66f7so17859785e9.1
 for <qemu-rust@nongnu.org>; Mon, 17 Mar 2025 10:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742232028; x=1742836828;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pAkgqrelAe4YIX3NAm9ZTxDn/cN/Kq4AFcPnu3EncxM=;
 b=D3UMDvNucue8E//4V8AbKYOzyosFXoj7zObTSyCYzN/5VnL/u/SGxTOkSC3Gd2mEs3
 8JRiitucY6Qpp4xz4rFRMJRcXEkNgcnJRwrVlXEWz7Dfme92aM3g4SGwtlBJqfCjsXk8
 kVE88cpuI0p7tBgvPRDZKZmeHlHurLst/sRQ3Y6iRpGfSuZ2dxbuuSrD6DVpjmBYe8sy
 cHFyM+qSOAB53NApF+5JCHvUaxgoAdQBKvP3nsmxAQIlrLYDp1Pu5G8EKeD1urn922Qp
 bHIU6Qg2eVu8TsbqjFuDOTkQhuTGUAeb6XSn0JwnAUol9s2hsSVsJlXBPwEgeZ8Oo7oP
 5nVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPMWNRDXu7/QyhY4dbxaZ/GlCL7dLHF4GvXffxhHmyKpcZLj98+mlrsOt4V46Ieep09yQsdgwrip8=@nongnu.org
X-Gm-Message-State: AOJu0Yz1vthLFODtPj0WrYCVNjmBuRgYhXPcGLrYhpA+tnOHuyJIJcyL
 nXiBkAH3d3QvUiRXHM/BCkjcqDcGLR7m9G+Lgi/44z1DPaPzN/ejnc1Pedr3dYZDXtPn5IQNpNk
 CI2iIdZ+Vv8TnNSZpV+mVQvNNEPqnODw9mONygP/Wfan2D5iRkEF1UM0smyiHm+f0jcOcG3l5DH
 npiTOATWxbFNGuVgfrNJ5QIfP1T9hF7pNe6w==
X-Gm-Gg: ASbGncvSTfVeVNyz5XlnN+OY8pAFIy/MFgZWRp3c01nLDZG6pchsn0v4BebQ1ArQTwM
 lVgWF9BB50A1R7NeEhKMeQfnnYgbHNhT3UYvUW7oW9/KdlKQich0UC9nQ26Yhv5pblQQETQYSdg
 ==
X-Received: by 2002:a5d:5983:0:b0:391:231b:8e0d with SMTP id
 ffacd0b85a97d-3996b499f9amr539220f8f.39.1742232028111; 
 Mon, 17 Mar 2025 10:20:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe7gKAVPP61hBKnKNkDAes+rayUO1PttJbPDctjksYGid1q7NzLltpkrtGr05bU3OzvI4czoK525pnoo9svmo=
X-Received: by 2002:a5d:5983:0:b0:391:231b:8e0d with SMTP id
 ffacd0b85a97d-3996b499f9amr539195f8f.39.1742232027793; Mon, 17 Mar 2025
 10:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250317151236.536673-1-zhao1.liu@intel.com>
In-Reply-To: <20250317151236.536673-1-zhao1.liu@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 17 Mar 2025 18:20:15 +0100
X-Gm-Features: AQ5f1JpXue-MvO9yOQMLIGNJiq_Ly6h2D9fE93JjCgkuem8P4bzX9thSk8Wkpr0
Message-ID: <CABgObfZaGU9C47BemJQubhmwaOiDDPaWVBC=ebAxGvU_NiRU-w@mail.gmail.com>
Subject: Re: [PATCH 00/17] rust/vmstate: Clean up, fix, enhance & test
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org, qemu-rust@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O759OA9jEtosPIMAHZR4NXdXxCJ0RE3R6BSwe-tESBQ_1742232029
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.335,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Mon, 17 Mar 2025 17:20:45 -0000

On Mon, Mar 17, 2025 at 3:52=E2=80=AFPM Zhao Liu <zhao1.liu@intel.com> wrot=
e:
> Hi,
>
> This series is in preparation for HPET migration support (in particular,
> to support varray and vmstate_validate), and it also cleans up and fixes
> the current vmstate! However, there is still the gap from being a =E2=80=
=98stable=E2=80=99
> vmstate.

Already a great improvement!

I quickly went through things that I was planning to do in a slightly
different way, but overall this is great work.  Give me a day or two
to finish reviewing and testing, most of it can already be applied to
qemu-rust or even to 10.0.

Thanks,

Paolo


